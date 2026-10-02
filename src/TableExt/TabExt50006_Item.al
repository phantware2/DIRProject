tableextension 50006 ItemExt extends Item
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
        field(50001; "Average Price"; Decimal)
        {
            Caption = 'Average Price';
            FieldClass = FlowField;
            CalcFormula = average("Value Entry"."Cost per Unit"
                where("Item No." = field("No."),
                      "Location Code" = field("Location Filter"),
                      "Valuation Date" = field("Date Filter")));
            Editable = false;
            ToolTip = 'Shows the average unit cost for this item for the selected location and date filters.';
        }
    }
}
