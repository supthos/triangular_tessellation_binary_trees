--  Abstract Machine
--  © Reed Lake Axewielder 2025

with Binary_Tree;
with Tree_Node;

procedure Triangular_Tessellation_Binary_Trees is
   Tape : Binary_Tree.Tree_Access := new Binary_Tree.btree;
begin
   Binary_Tree.Initialization (Tape, (2**4) - 1);
   Tree_Node.Print_Values (Tape.Root);
end Triangular_Tessellation_Binary_Trees;
