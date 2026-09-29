table 50004 "Whse. Notification Entry"
{
    Caption = 'Warehouse Notification Entry';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }

        field(10; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
        }

        field(20; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location.Code;
        }

        field(30; "Document Type"; Enum "Whse. Notification Doc. Type")
        {
            Caption = 'Document Type';
        }

        field(40; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }

        field(50; Message; Text[250])
        {
            Caption = 'Message';
        }

        field(60; "Created At"; DateTime)
        {
            Caption = 'Created At';
        }

        field(70; Read; Boolean)
        {
            Caption = 'Read';
        }

        field(80; "Read At"; DateTime)
        {
            Caption = 'Read At';
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }

        key(UserNotification; "User ID", Read)
        {
        }

        // Prevent duplicate notifications for the same
        // warehouse document and user.
        key(DocumentUser; "User ID", "Document Type", "Document No.")
        {
        }
    }
}