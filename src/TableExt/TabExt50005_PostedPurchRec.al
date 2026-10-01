tableextension 50005 PostedPurchRcptHeaderExt extends "Purch. Rcpt. Header"
{
    fields
    {
        field(50000; "Driver Name"; Text[100])
        {
            Caption = 'Driver Name';
            DataClassification = customerContent;
            editable = false;
        }
        field(50001; "Vehicle No."; Text[50])
        {
            Caption = 'Vehicle No.';
            DataClassification = customerContent;
            editable = false;
        }
    }
}
