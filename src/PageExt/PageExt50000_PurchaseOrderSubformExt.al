pageextension 50000 PurchaseOrderSubformExt extends "Purchase Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter(Quantity)
        {
            field(bags; Rec."Bags")
            {
                ApplicationArea = All;
                Caption = 'No. of Bags';
            }
            field(grossweight; Rec.GrossWeight)
            {
                ApplicationArea = All;
                Caption = 'Gross Weight';
            }
            field(tareweight; Rec.TareWeight)
            {
                ApplicationArea = All;
                Caption = 'Tare Weight';
            }
            field(netweight; Rec.NetWeight)
            {
                ApplicationArea = All;
                Caption = 'Net Weight';
            }
            field(averageweight; Rec.AverageWeight)
            {
                ApplicationArea = All;
                Caption = 'Average Weight';
            }

        }
{
    FieldPropertyName = FieldPropertyValue;
}
{
    ApplicationArea = All;
}

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}