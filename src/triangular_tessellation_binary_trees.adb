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
   T_Vector : Tree_Vector.Vector;
begin
   Binary_Tree.Initialization (Tape, 0);
   Tree_Vector.Append(T_Vector, Tape);
   T_Vector := Next_Degree (T_Vector);
   --  Trees:  30
   --  Trees:  900
   --  Trees:  27000
   --  Trees:  810000
   Ada.Text_IO.Put_Line ("Trees: " & Integer'Image(Integer(T_Vector.Length)));
   T_Vector := Next_Degree (T_Vector);
   Ada.Text_IO.Put_Line ("Trees: " & Integer'Image(Integer(T_Vector.Length)));
   T_Vector := Next_Degree (T_Vector);
   Ada.Text_IO.Put_Line ("Trees: " & Integer'Image(Integer(T_Vector.Length)));
   T_Vector := Next_Degree (T_Vector);
   Ada.Text_IO.Put_Line ("Trees: " & Integer'Image(Integer(T_Vector.Length)));

   
   
   
end Triangular_Tessellation_Binary_Trees;
