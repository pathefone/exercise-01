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
                field("No."; "No.")
                {
                    //ApplicationArea = All;
                    Enabled = false;
                }
                field(Parameters; Parameters)
                {
                    //ApplicationArea = All;
                    Enabled = isEnabledState;
                    
                }
                field(IsParameterNeeded; IsParameterNeeded)
                {
                   // ApplicationArea = All;
                   trigger OnValidate()
                    begin
                        if(IsParameterNeeded = true) then
                        isEnabledState := true
                        else
                        isEnabledState := false;
                    end;
                }
                field(Description;Description)
                {
                    Enabled = false;
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
                    randomNumArray: array [100] of Integer;
                    balsiuKiekis: Integer;
                    priebalsiuKiekis: Integer;
                begin
                    CopyArray(randomNumArray, FirstCodeunit.GenerateRandomArray(),1,100);
                    
                    if("No." = 1) then
                        FirstCodeunit.ReverseStr(Parameters);
                    if("No." = 2) then
                        FirstCodeunit.FindMaxMin(randomNumArray);
                    if("No." = 3) then
                        FirstCodeunit.FindDuplicates(randomNumArray);
                    if("No." = 4) then
                    begin
                        balsiuKiekis := FirstCodeunit.BalsiuKiekis(tekstas);
                        priebalsiuKiekis := FirstCodeunit.PriebalsiuKiekis(tekstas);
                        Message('Balsiu kiekis: ' + '%1\' + ', ' + 'Priebalsiu kiekis: ' + '%2\', balsiuKiekis, priebalsiuKiekis);
                    end;
                end;
            }  
        }
    }

        trigger OnOpenPage()
        begin
            if(IsParameterNeeded = true) then
            isEnabledState := true
            else
            isEnabledState := false;
        end;


    var
        myInt: Integer;
        inputText: Text;
        tekstas: Label 'Programuotojo ar tiesiog bet kokio IT specialisto profesija taps vis labiau įprasta';
        isEnabledState: Boolean;
}