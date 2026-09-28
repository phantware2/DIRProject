tableextension 50002 SalesLineExt extends "Sales Line"
{
    fields
    {
        field(50000; "Available Quantity"; Decimal)
        {
            Caption = 'Available Quantity';
            FieldClass = FlowField;
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No."), "Location Code" = field("Location Code")));
            Editable = false;
            DecimalPlaces = 0 : 5;
        }
    }
}
