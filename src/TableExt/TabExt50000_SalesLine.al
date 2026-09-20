tableextension 50000 SalesLineExt extends "Sales Line"
{
    fields
    {
        // Add changes to table fields here
        field(50000; Bags; Integer)
        {
            DataClassification = ToBeClassified;
            caption = 'No. of Bags';
        }
        field(50100; GrossWeight; integer)
        {
            DataClassification = ToBeClassified;
            caption = 'Gross Weight';
        }
        field(50200; TareWeight; integer)
        {
            DataClassification = ToBeClassified;
            caption = 'Tare Weight';
        }
        field(50300; NetWeight; integer)
        {
            DataClassification = ToBeClassified;
            caption = 'Net Weight';

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                NetWeight := GrossWeight - TareWeight;
            end;

        }
        field(50400; AverageWeight; integer)
        {
            DataClassification = ToBeClassified;
            caption = 'Average Weight';

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                AverageWeight := NetWeight / Bags;
            end;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}