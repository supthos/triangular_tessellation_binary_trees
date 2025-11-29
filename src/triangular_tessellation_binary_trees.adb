--  Abstract Machine
--  © Reed Lake Axewielder 2025

with Ada.Text_IO;
with Binary_Tree;
use Binary_Tree;
with Tree_Node;
with Plane_Tessellation;
use Plane_Tessellation;

procedure Triangular_Tessellation_Binary_Trees is
   Tape : Tree_Access := new btree;
   Tess : PlTess_Access := new pltess;
   P_Vector : Point_Vector.Vector;
   Q_Vector : Point_Vector.Vector;
   R_Vector : Point_Vector.Vector;
   -- Graph : Plane_Tessellation.Point_Vector.Vector;
   T_Vector : Tree_Vector.Vector;
begin
   Binary_Tree.Initialization (Tape, 0);
   Tree_Vector.Append(T_Vector, Tape);
   T_Vector := Next_Degree (T_Vector);
   for tree of T_Vector loop
      Binary_Tree.Print_Tree (tree.Root);
   end loop;
   -- should read "Trees:  30"
   Ada.Text_IO.Put_Line ("Trees: " & Integer'Image(Integer(T_Vector.Length)));
   
end Triangular_Tessellation_Binary_Trees;
