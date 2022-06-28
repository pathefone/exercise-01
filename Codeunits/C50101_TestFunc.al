codeunit 50101 TestingCodeunit
{
    trigger OnRun()
    begin

    end;

    procedure ReverseStr(textVar: Text[30])
    var
        result: Text[30];
        length: Integer;
        letter: Text[30];
    begin
        length := StrLen(textVar);
        result := '';
        while length > 0 do begin
            letter := CopyStr(textVar, length, 1);
            result += letter;
            length := length - 1;
        end;
        Message(result);

    end;

    procedure GenerateRandomArray() GeneratedArray: array[100] of Integer
    var
        maxNum: Integer;
    begin
        maxNum := 101;
        for counter := 1 to 100 do
        begin
            GeneratedArray[counter] := Random(maxNum); //inclusive
        if GeneratedArray[counter] = 1 then
            GeneratedArray[counter] := 2; //specific case for 3rd task, because of algo 
        end;
    end;

    procedure FindMaxMin(numbersArray: Array[100] of Integer)
    var
        maxNum: Integer;
        minNum: Integer;
        temp: Integer;
    begin
        maxNum := numbersArray[1];
        minNum := numbersArray[1];
        for counter := 1 to 100 do
            temp := numbersArray[counter];
        if (temp > maxNum) then
            maxNum := temp;
        if (temp < minNum) then
            minNum := temp;

        Message(maxValueLabel + '%1\' + ', ' + minValueLabel + '%2\', maxNum, minNum);
        //create another procedure for messaging?
    end;

    procedure FindDuplicates(numbersArray: array[100] of Integer)
    var
        index: Integer;
        duplicateValues: List of [Integer];
    begin
        for counter := 1 to 100 do
        begin
            index := System.Abs(numbersArray[counter]) - 1;
            if (numbersArray[index] < 0) then
                duplicateValues.Add(numbersArray[counter]);
            numbersArray[index] := numbersArray[index] * -1;
        end;


        Message('%1\', duplicateValues.Count);
    end;

    procedure BalsiuKiekis(textVar: Text) BalsesCount: Integer
    var
        balsesArray: List of [Text];
        length: Integer;
        letter: Text;
    begin
        length := StrLen(textVar);
        balsesArray.AddRange('a', 'ą', 'e', 'ę', 'ė', 'i', 'į', 'y', 'o', 'u', 'ų', 'ū');

        while length > 0 do begin
            letter := CopyStr(textVar, length, 1);
            letter := LowerCase(letter);
            length := length - 1;
            for counter := 1 to 12 do
                if (balsesArray.Get(counter) = letter) then
                    BalsesCount := BalsesCount + 1;
        end;

    end;

    procedure PriebalsiuKiekis(textVar: Text) prieBalsesCount: Integer
    var
        priebalsesArray: List of [Text];
        length: Integer;
        letter: Text;
    begin
        length := StrLen(textVar);
        priebalsesArray.AddRange('b', 'c', 'č', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm',
                                  'n', 'p', 'r', 's', 'š', 't', 'v', 'z', 'ž');

        while length > 0 do begin
            letter := CopyStr(textVar, length, 1);
            letter := LowerCase(letter);
            length := length - 1;
            for counter := 1 to 20 do
                if (priebalsesArray.Get(counter) = letter) then
                    prieBalsesCount := prieBalsesCount + 1;
        end;
    end;

    procedure InsertRecord(id: Integer;parameters: Text;description: Text;isParameterNeeded: Boolean)
    var
        ProcedureRecord: Record Procedures;
    begin
        ProcedureRecord.Init();
        ProcedureRecord."No." := id;
        ProcedureRecord.Parameters := parameters;
        ProcedureRecord.Description := description;
        ProcedureRecord.IsParameterNeeded := isParameterNeeded;
        if ProcedureRecord.Insert(false,false) then
                Sleep(1); //if already exists
    end;


    var
        myInt: Integer;
        counter: Integer;
        maxValueLabel: Label 'Max value: ';
        minValueLabel: Label 'Min value: ';
}