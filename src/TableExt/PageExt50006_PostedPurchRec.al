pageextension 50006 PostedPurchRcptHeaderExt extends "Posted Purchase Receipt"
{
    layout
    {
        addlast(General)
        {
            field("Driver Name"; Rec."Driver Name")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Vehicle No."; Rec."Vehicle No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
}
