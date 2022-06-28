table 50101 Procedures
{
    Caption = 'Procedure List';

    fields
    {
        field(1; "No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; Parameters; Text[50])
        {
            Description = 'Parameters for procedure';
        }
        field(3; IsParameterNeeded; Boolean)
        {
            Description = 'Are parameters needed for a procedure.';
        }
        field(4; Description; Text[50])
        {
            Description = 'Task description';
        }
        
    }
    keys
    {
        key(PrimaryKey; "No.")
        {
            Clustered = true; //?
        }
    }
}