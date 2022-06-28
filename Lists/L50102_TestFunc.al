page 50102 ProcedureList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Procedures;
    CardPageId = 50101;
    Caption = 'Procedure List';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                    //ApplicationArea = All;
                }
                field(Parameters; Parameters)
                {
                    //ApplicationArea = All;
                }
                field(IsParameterNeeded; IsParameterNeeded)
                {
                   // ApplicationArea = All;
                }
                field(Description;Description)
                {

                }
            }
        }
    }

        trigger OnInit()
        var
            ProcedureRecord: Record Procedures;
            FirstCodeunit: Codeunit TestingCodeunit;
        begin

            FirstCodeunit.InsertRecord(1, 'Programuotojas', 'Pirma uzduotis', true);
            FirstCodeunit.InsertRecord(2, '', 'Antra uzduotis', false);
            FirstCodeunit.InsertRecord(3, '', 'Trecia uzduotis', false);
            FirstCodeunit.InsertRecord(4, '', 'Ketvirta uzduotis', false);

        end;
}