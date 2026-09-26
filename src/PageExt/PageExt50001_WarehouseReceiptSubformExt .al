pageextension 50001 WarehouseReceiptSubformExt extends "Whse. Receipt Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field(Bags; Rec.Bags)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the number of bags.';
            }
            field(GrossWeight; Rec.GrossWeight)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the gross weight.';
            }
            field(TareWeight; Rec.TareWeight)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the tare weight.';
            }
            field(NetWeight; Rec.NetWeight)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the net weight.';
            }
            field(AverageWeight; Rec.AverageWeight)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the average weight per bag.';
            }
        }
    }
}