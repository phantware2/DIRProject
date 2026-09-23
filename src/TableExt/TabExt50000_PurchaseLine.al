tableextension 50000 PurchaseLineExt extends "Purchase Line"
{
    fields
    {
        // Add changes to table fields here
        field(50000; Bags; Integer)
        {
            DataClassification = ToBeClassified;
            caption = 'No. of Bags';

            trigger OnValidate()
            begin
                if (bags <> 0) and (netweight <> 0) then
                    AverageWeight := NetWeight / Bags;
            end;

        }
        field(50100; GrossWeight; integer)
        {
            DataClassification = ToBeClassified;
            caption = 'Gross Weight';
            trigger OnValidate()
            var
            begin
                if (GrossWeight <> 0) and (tareweight <> 0) then
                    NetWeight := GrossWeight - TareWeight;
            end;
        }
        field(50200; TareWeight; integer)
        {
            DataClassification = ToBeClassified;
            caption = 'Tare Weight';
            trigger OnValidate()
            var
            begin
                if (GrossWeight <> 0) and (tareweight <> 0) then
                    NetWeight := GrossWeight - TareWeight;
            end;
        }
        field(50300; NetWeight; integer)
        {
            DataClassification = ToBeClassified;
            caption = 'Net Weight';
            Editable = false;

            trigger OnValidate()
            begin
                if (bags <> 0) and (netweight <> 0) then
                    AverageWeight := NetWeight / Bags;
            end;
        }
        field(50400; AverageWeight; integer)
        {
            DataClassification = ToBeClassified;
            caption = 'Average Weight';
            Editable = false;
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