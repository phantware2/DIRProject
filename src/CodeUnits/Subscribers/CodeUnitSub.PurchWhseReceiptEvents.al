codeunit 50001 "Purch. Whse. Receipt Events"
{
    [EventSubscriber(
        ObjectType::Codeunit,
        Codeunit::"Purchases Warehouse Mgt.",
        'OnPurchLine2ReceiptLineOnAfterSetQtysOnRcptLine',
        '',
        false,
        false)]
    local procedure OnPurchLine2ReceiptLineOnAfterSetQtysOnRcptLine(
        var WarehouseReceiptLine: Record "Warehouse Receipt Line";
        PurchaseLine: Record "Purchase Line")
    begin
        TransferWeightDetails(PurchaseLine, WarehouseReceiptLine);
    end;

    local procedure TransferWeightDetails(
        PurchaseLine: Record "Purchase Line";
        var WarehouseReceiptLine: Record "Warehouse Receipt Line")
    begin
        WarehouseReceiptLine.Bags := PurchaseLine.Bags;
        WarehouseReceiptLine.GrossWeight := PurchaseLine.GrossWeight;
        WarehouseReceiptLine.TareWeight := PurchaseLine.TareWeight;
        WarehouseReceiptLine.NetWeight := PurchaseLine.NetWeight;
        WarehouseReceiptLine.AverageWeight := PurchaseLine.AverageWeight;
    end;
}