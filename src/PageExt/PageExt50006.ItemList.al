
pageextension 50006 ItemListExt extends "Item List"
{
    layout
    {
        addlast(Control1)
        {
            field("Item Value"; Rec."Item Value")
            {
                ApplicationArea = All;
                ToolTip = 'Shows the actual cost value of this item for the selected location and date filters.';
            }
        }
    }
}
