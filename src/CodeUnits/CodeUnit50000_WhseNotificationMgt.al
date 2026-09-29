codeunit 50000 "Whse. Notification Mgt."
{
    procedure CreateReceiptNotifications(
        WhseReceiptHeader: Record "Warehouse Receipt Header")
    var
        WarehouseEmployee: Record "Warehouse Employee";
    begin
        if WhseReceiptHeader."No." = '' then
            exit;

        if WhseReceiptHeader."Location Code" = '' then
            exit;

        WarehouseEmployee.SetRange("Location Code", WhseReceiptHeader."Location Code");

        if WarehouseEmployee.FindSet() then
            repeat
                CreateNotificationEntry(
                    WarehouseEmployee."User ID", WhseReceiptHeader."Location Code", Enum::"Whse. Notification Doc. Type"::Receipt, WhseReceiptHeader."No.");
            until WarehouseEmployee.Next() = 0;
    end;


    procedure CreateShipmentNotifications(
        WhseShipmentHeader: Record "Warehouse Shipment Header")
    var
        WarehouseEmployee: Record "Warehouse Employee";
    begin
        if WhseShipmentHeader."No." = '' then
            exit;

        if WhseShipmentHeader."Location Code" = '' then
            exit;

        WarehouseEmployee.SetRange("Location Code", WhseShipmentHeader."Location Code");

        if WarehouseEmployee.FindSet() then
            repeat
                CreateNotificationEntry(WarehouseEmployee."User ID", WhseShipmentHeader."Location Code", Enum::"Whse. Notification Doc. Type"::Shipment, WhseShipmentHeader."No.");
            until WarehouseEmployee.Next() = 0;
    end;


    local procedure CreateNotificationEntry(WarehouseUserID: Code[50]; LocationCode: Code[10]; DocumentType: Enum "Whse. Notification Doc. Type"; DocumentNo: Code[20])
    var
        WhseNotificationEntry: Record "Whse. Notification Entry";
    begin
        if WarehouseUserID = '' then
            exit;

        // Avoid creating duplicate notification entries.
        WhseNotificationEntry.SetRange("User ID", WarehouseUserID);
        WhseNotificationEntry.SetRange("Document Type", DocumentType);
        WhseNotificationEntry.SetRange("Document No.", DocumentNo);

        if not WhseNotificationEntry.IsEmpty() then
            exit;

        WhseNotificationEntry.Init();
        WhseNotificationEntry."User ID" := WarehouseUserID;
        WhseNotificationEntry."Location Code" := LocationCode;
        WhseNotificationEntry."Document Type" := DocumentType;
        WhseNotificationEntry."Document No." := DocumentNo;
        WhseNotificationEntry."Created At" := CurrentDateTime;
        WhseNotificationEntry.Read := false;

        case DocumentType of
            DocumentType::Receipt:
                WhseNotificationEntry.Message :=
                    StrSubstNo(
                        'Warehouse Receipt %1 has been created for location %2.',
                        DocumentNo,
                        LocationCode);

            DocumentType::Shipment:
                WhseNotificationEntry.Message :=
                    StrSubstNo('Warehouse Shipment %1 has been created for location %2.', DocumentNo, LocationCode);
        end;

        WhseNotificationEntry.Insert(true);
    end;


    procedure SendPendingNotifications()
    var
        WhseNotificationEntry: Record "Whse. Notification Entry";
        WhseNotification: Notification;
    begin
        WhseNotificationEntry.SetRange("User ID", UserId);
        WhseNotificationEntry.SetRange(Read, false);

        if WhseNotificationEntry.FindSet() then
            repeat
                Clear(WhseNotification);

                WhseNotification.Id := CreateGuid();
                WhseNotification.Scope := NotificationScope::LocalScope;
                WhseNotification.Message :=
                    WhseNotificationEntry.Message;

                WhseNotification.SetData(
                    'EntryNo',
                    Format(WhseNotificationEntry."Entry No."));

                WhseNotification.AddAction(
                    'Open Document',
                    Codeunit::"Whse. Notification Mgt.",
                    'OpenWarehouseDocument');

                WhseNotification.Send();

                // Mark it as read after it has been presented
                // to the user's client.
                WhseNotificationEntry.Read := true;
                WhseNotificationEntry."Read At" := CurrentDateTime;
                WhseNotificationEntry.Modify();
            until WhseNotificationEntry.Next() = 0;
    end;


    procedure OpenWarehouseDocument(
        WhseNotification: Notification)
    var
        WhseNotificationEntry: Record "Whse. Notification Entry";
        WhseReceiptHeader: Record "Warehouse Receipt Header";
        WhseShipmentHeader: Record "Warehouse Shipment Header";
        EntryNo: Integer;
    begin
        Evaluate(
            EntryNo,
            WhseNotification.GetData('EntryNo'));

        if not WhseNotificationEntry.Get(EntryNo) then
            exit;

        case WhseNotificationEntry."Document Type" of

            WhseNotificationEntry."Document Type"::Receipt:
                begin
                    if WhseReceiptHeader.Get(
                        WhseNotificationEntry."Document No.")
                    then
                        Page.Run(Page::"Warehouse Receipt", WhseReceiptHeader);
                end;

            WhseNotificationEntry."Document Type"::Shipment:
                begin
                    if WhseShipmentHeader.Get(
                        WhseNotificationEntry."Document No.")
                    then
                        Page.Run(Page::"Warehouse Shipment", WhseShipmentHeader);
                end;
        end;
    end;
}