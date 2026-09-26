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
                CalculateWeights();
            end;

        }
        field(50100; GrossWeight; Decimal)
        {
            DataClassification = ToBeClassified;
            caption = 'Gross Weight';

            trigger OnValidate()
            begin
                CalculateWeights();
            end;
        }
        field(50200; TareWeight; Decimal)
        {
            DataClassification = ToBeClassified;
            caption = 'Tare Weight';
            trigger OnValidate()
            var
            begin
                CalculateWeights();
            end;
        }
        field(50300; NetWeight; Decimal)
        {
            DataClassification = ToBeClassified;
            caption = 'Net Weight';
            Editable = false;

            trigger OnValidate()
            begin
                CalculateWeights();
            end;
        }
        field(50400; AverageWeight; Decimal)
        {
            DataClassification = ToBeClassified;
            caption = 'Average Weight';
            Editable = false;

            trigger OnValidate()
            begin
                CalculateWeights();
            end;
        }
    }

    local procedure CalculateWeights()
    begin
        if (GrossWeight <> 0) and (TareWeight <> 0) then begin
            NetWeight := GrossWeight - TareWeight;
        end;
        if (Bags <> 0) and (NetWeight <> 0) then
            AverageWeight := NetWeight / Bags;
    end;

}