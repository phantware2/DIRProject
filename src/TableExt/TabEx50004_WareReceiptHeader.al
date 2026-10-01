tableextension 50004 "WareReceiptHeaderExt" extends "Warehouse Receipt Header"
{
    fields
    {
        field(50000; "Driver Name"; Text[100])
        {
            Caption = 'Driver Name';
            DataClassification = customerContent;
        }

        field(50001; "Vehicle No."; Text[50])
        {
            Caption = 'Vehicle No.';
            DataClassification = customerContent;
        }
    }
}
