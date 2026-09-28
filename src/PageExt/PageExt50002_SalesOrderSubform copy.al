pageextension 50003 TransferOrderSubformExt extends "Transfer Order Subform"
{
    layout
    {
        addbefore(quantity)
        {
            field(availablequantity; Rec."Available Quantity")
            {
                ApplicationArea = All;
                Caption = 'Available Quantity';
                ToolTip = 'Specifies the available quantity for the transfer line.';
            }
        }
    }
}
