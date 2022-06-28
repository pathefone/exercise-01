page 50101 "Procedures Page"
{
    Caption = 'Procedures Page';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Procedures;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No."; Rec."No.")
                {
                    //ApplicationArea = All;
                    Enabled = false;
                }
                field(Parameters; Rec.Parameters)
                {
                    //ApplicationArea = All;
                    Enabled = isEnabledState;

                }
                field(Description; Rec.Description)
                {
                    Enabled = false;
                }
                field(IsParameterNeeded; Rec.IsParameterNeeded)
                {
                    //ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        isEnabledState := Rec.IsParameterNeeded;
                    end;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Execute Procedure")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    FirstCodeunit: Codeunit TestingCodeunit;
                    randomNumArray: array[100] of Integer;
                    balsiuKiekis: Integer;
                    priebalsiuKiekis: Integer;
                    balsesPriebalsesText: Label 'Balsiu kiekis: %1\, Priebalsiu kiekis: %2\';
                    tekstas: Label 'Programuotojo ar tiesiog bet kokio IT specialisto profesija taps vis labiau įprasta';
                begin
                    CopyArray(randomNumArray, FirstCodeunit.GenerateRandomArray(), 1, 100);

                    if (Rec."No." = 1) then
                        FirstCodeunit.ReverseStr(Rec.Parameters);
                    if (Rec."No." = 2) then
                        FirstCodeunit.FindMaxMin(randomNumArray);
                    if (Rec."No." = 3) then
                        FirstCodeunit.FindDuplicates(randomNumArray);
                    if (Rec."No." = 4) then begin
                        balsiuKiekis := FirstCodeunit.BalsiuKiekis(tekstas);
                        priebalsiuKiekis := FirstCodeunit.PriebalsiuKiekis(tekstas);
                        Message(balsesPriebalsesText, balsiuKiekis, priebalsiuKiekis);
                    end;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        isEnabledState := Rec.IsParameterNeeded;
    end;


    var
        myInt: Integer;
        inputText: Text;
        isEnabledState: Boolean;
}