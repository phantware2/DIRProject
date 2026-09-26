tableextension 50001 WarehouseReceiptLineExt extends "Warehouse Receipt Line"
{
    fields
    {
        field(50000; Bags; Decimal)
        {
            Caption = 'No. of Bags';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(50100; GrossWeight; Decimal)
        {
            Caption = 'Gross Weight';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(50200; TareWeight; Decimal)
        {
            Caption = 'Tare Weight';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(50300; NetWeight; Decimal)
        {
            Caption = 'Net Weight';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(50400; AverageWeight; Decimal)
        {
            Caption = 'Average Weight';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
}