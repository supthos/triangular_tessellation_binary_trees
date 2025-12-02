--  Abstract Machine
--  © Reed Lake Axewielder 2025

with Ada.Assertions;
use Ada.Assertions;
with Ada.Text_IO;
use Ada.Text_IO;
with Binary_Tree;
use Binary_Tree;
with Tree_Node;
with Plane_Tessellation;
use Plane_Tessellation;
with Tree_Node;
use Tree_Node;

procedure Triangular_Tessellation_Binary_Trees is
   --  Tape : Tree_Access := new btree;
   --  T_Vector : Tree_Vector.Vector;
   --  Tree_Index : Tree_Vector.Extended_Index;
   --  Counter : Natural :=0;
   Tree1 : Tree_Access := new btree;
   Tree2 : Tree_Access := new btree;
   Tree3 : Tree_Access := new btree;
   --  Node : Node_Access := null;
   --  Point1 : PlTess_Access := new pltess;
begin
   --  Binary_Tree.Initialization (Tape);
   --  Tree_Vector.Append(T_Vector, Tape);
   --  T_Vector := Next_Degree (T_Vector);

   --  Ada.Text_IO.Put_Line ("Trees: " & Integer'Image(Integer(T_Vector.Length)));
   
   Initialization (Tree1);
   Initialization (Tree2);
   Initialization (Tree3);

   Put_Line ("Initialized");

   if Set_Point_Values (Tree1.Root, -2.0, 1.0, 1.0) then
      if Insert_Point (Tree1, Tree1.Root.Point.all + P_Direction) then
         if Insert_Point (Tree1, Tree1.Root.Point.all + Q_Direction) then
            Put_Line ("Tree1 Good");
         else
            Put_Line ("insertion 2 failed");
         end if;
      else
         Put_Line ("Insertion 1 failed");
      end if;
   else  
      Put_Line ("tree1 not good");
   end if;


   --Assert (Set_Point_Values(Tree2.Root, -3.0, 7.0, -4.0));
   --Assert (Insert_Point (Tree2, Tree2.Root.Point.all + U_Direction));
   --Assert (Insert_Point (Tree2, Tree2.Root.Point.all + Q_Direction));


   Put_Line ("Tree1");
   Print_Point (Tree1.Root.Left.point.all - Tree1.Root.Right.Point.all);
   Put_Line ("Tree2");
   Print_Point (Tree2.Root.Left.point.all - Tree2.Root.Right.Point.all);


   --Node := new tnode;
   --Assert (Set_Point_Values (Node,1.0,0.0,-1.0));
   --  Assert (Insert_Node_Values (Tree1, 1.0,0.0,-1.0));
   --  Node := new tnode;
   --  Assert(Set_Point(Node,0.0,1.0,-1.0));
   --  Insert_Node (Tree1,Node);

   --  Node := new tnode;
   --  Assert(Set_Point(Node,-1.0,0.0,1.0));
   --  Insert_Node (Tree2.Root,Node);
   --  Node := new tnode;
   --  Assert(Set_Point(Node,0.0,-1.0,1.0));
   --  Insert_Node (Tree2.Root,Node);

   --  Node := new tnode;
   --  Assert(Set_Point(Node,1.0,-1.0,0.0));
   --  Insert_Node (Tree3.Root,Node);
   --  Node := new tnode;
   --  Assert(Set_Point(Node,-1.0,1.0,0.0));
   --  Insert_Node (Tree3.Root,Node);
   

   --  if Compare (Tree1, Tree2) = true then
   --     Ada.Text_IO.Put_Line("Okay");
   --  else
   --     Ada.Text_IO.Put_Line ("Not Okay");
   --  end if;

   --  if Compare (Tree1, Tree3) /= true then
   --     Ada.Text_IO.Put_Line("Okay");
   --  else
   --     Ada.Text_IO.Put_Line ("Not Okay");
   --  end if;

   --  if Compare (Tree2, Tree3) /= true then
   --     Ada.Text_IO.Put_Line("Okay");
   --  else
   --     Ada.Text_IO.Put_Line ("Not Okay");
   --  end if;


   --Tree_Index := T_Vector.First_Index;
   


   --  for tree of T_Vector loop
   --     if Compare (tree, T_Vector.Element (Tree_Index)) = true then
   --        Ada.Text_IO.Put_Line (Natural'Image(Counter));
   --     end if;
   --     Counter := Counter + 1;
   --  end loop;
--   Reduce(T_Vector);
   --Ada.Text_IO.Put_Line ("Trees: " & Integer'Image(Integer(T_Vector.Length)));
   
   
   
end Triangular_Tessellation_Binary_Trees;
