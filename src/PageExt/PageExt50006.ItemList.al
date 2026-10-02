
pageextension 50006 ItemListExt extends "Item List"
{
    layout
    {
        addafter(Type)
        {
            field("Item Value"; Rec."Item Value")
            {
                ApplicationArea = All;
                caption = 'Inventory Value';
                ToolTip = 'Shows the actual cost value of this item for the selected location and date filters.';
            }
        }
    }
}
