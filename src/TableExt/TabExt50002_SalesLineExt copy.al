tableextension 50003 TransferLineExt extends "Transfer Line"
{
    fields
    {
        field(50000; "Available Quantity"; Decimal)
        {
            Caption = 'Available Quantity';
            FieldClass = FlowField;
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("Item No."), "Location Code" = field("Transfer-from Code")));
            Editable = false;
            DecimalPlaces = 0 : 5;
        }
    }
}
