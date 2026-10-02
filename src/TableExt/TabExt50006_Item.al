tableextension 50006 "Item Ext 50006" extends Item
{
    fields
    {
        field(50000; "Item Value"; Decimal)
        {
            Caption = 'Item Value';
            FieldClass = FlowField;
            CalcFormula = sum("Value Entry"."Cost Amount (Actual)"
                where("Item No." = field("No."),
                      "Location Code" = field("Location Filter"),
                      "Valuation Date" = field("Date Filter")));
            Editable = false;
            ToolTip = 'Shows the actual cost value of this item for the selected location and date filters.';
        }
    }
}

pageextension 50006 "Item Card Ext 50006" extends "Item Card"
{
    layout
    {
        addlast(General)
        {
            field("Item Value"; Rec."Item Value")
            {
                ApplicationArea = All;
                ToolTip = 'Shows the actual cost value of this item for the selected location and date filters.';
            }
        }
    }
}
