pageextension 50002 SalesOrderSubformExt extends "Sales Order Subform"
{
    layout
    {
        addafter(quantity)
        {
            field(availablequantity; Rec."Available Quantity")
            {
                ApplicationArea = All;
                Caption = 'Available Quantity';
                ToolTip = 'Specifies the available quantity for the sales line.';
            }
        }
    }
}
