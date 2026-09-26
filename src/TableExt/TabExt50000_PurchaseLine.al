tableextension 50000 PurchaseLineExt extends "Purchase Line"
{
    fields
    {
        // Add changes to table fields here
        field(50000; Bags; Decimal)
        {
            DataClassification = ToBeClassified;
            caption = 'No. of Bags';

            trigger OnValidate()
            begin
                Rec.Validate(GrossWeight);
                Rec.Validate(TareWeight);
            end;

        }
        field(50100; GrossWeight; Decimal)
        {
            DataClassification = ToBeClassified;
            caption = 'Gross Weight';

            trigger OnValidate()
            begin
                Rec.Validate(Tareweight);
            end;
        }
        field(50200; TareWeight; Decimal)
        {
            DataClassification = ToBeClassified;
            caption = 'Tare Weight';
            trigger OnValidate()
            var
            begin
                if (GrossWeight <> 0) and (tareweight <> 0) then begin
                    NetWeight := GrossWeight - TareWeight;
                end;
                if (bags <> 0) and (netweight <> 0) then
                    AverageWeight := NetWeight / Bags;
            end;
        }
        field(50300; NetWeight; Decimal)
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
        field(50400; AverageWeight; Decimal)
        {
            DataClassification = ToBeClassified;
            caption = 'Average Weight';
            Editable = false;

            trigger OnValidate()
            begin
                if (bags <> 0) and (netweight <> 0) then
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
        myInt: Decimal;

}