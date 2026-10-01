pageextension 50004 WarehouseReceiptExt extends "Warehouse Receipt"
{
    layout
    {
        addlast(General)
        {
            field("Driver Name"; Rec."Driver Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the driver name.';
            }
            field("Vehicle No."; Rec."Vehicle No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the vehicle number.';
            }
        }
    }
}
