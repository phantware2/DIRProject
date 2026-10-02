codeunit 50002 "Posted Purch. Rec."
{
    // [EventSubscriber(
    //     ObjectType::Codeunit,
    //     Codeunit::"Purch.-Post", 'OnAfterPurchRcptHeaderInsert', '', false, false)]
    // local procedure CopyDriverAndVehicleToPostedReceipt(
    //     var PurchRcptHeader: Record "Purch. Rcpt. Header";
    //     PurchHeader: Record "Purchase Header")
    // var
    //     WhseReceiptHeader: Record "Warehouse Receipt Header";
    //     WhseReceiptLine: Record "Warehouse Receipt Line";
    // begin
    //     if not FindWarehouseReceiptHeader(PurchHeader, WhseReceiptHeader, WhseReceiptLine) then
    //         exit;

    //     PurchRcptHeader."Driver Name" := WhseReceiptHeader."Driver Name";
    //     PurchRcptHeader."Vehicle No." := WhseReceiptHeader."Vehicle No.";
    // end;

    // local procedure FindWarehouseReceiptHeader(
    //     PurchHeader: Record "Purchase Header";
    //     var WhseReceiptHeader: Record "Warehouse Receipt Header";
    //     var WhseReceiptLine: Record "Warehouse Receipt Line"): Boolean
    // begin
    //     WhseReceiptLine.Reset();
    //     WhseReceiptLine.SetRange("Source Type", Database::"Purchase Line");
    //     WhseReceiptLine.SetRange("Source Subtype", PurchHeader."Document Type".AsInteger());
    //     WhseReceiptLine.SetRange("Source No.", PurchHeader."No.");

    //     if not WhseReceiptLine.FindFirst() then
    //         exit(false);

    //     if not WhseReceiptHeader.Get(WhseReceiptLine."No.") then
    //         exit(false);

    //     exit(true);
    // end;
}