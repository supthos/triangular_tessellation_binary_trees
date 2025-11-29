with Ada.Assertions;
use Ada.Assertions;
with Ada.Strings;
with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;
with Ada.Text_IO;
with Plane_Tessellation;
use Plane_Tessellation;


package body Binary_Tree is
   procedure Initialization (This : Tree_Access; S : Natural) is
      Counter : Natural := 0;
   begin
      This.Root := new tnode;
      Assert( Set_Point (This.Root, 0.0, 0.0, 0.0) );
      while Counter < S loop
         Insert_Node (This.Root, new tnode);
         Counter := Counter + 1;
      end loop;
      This.Size := Counter;
   end Initialization;
   procedure Print_Tree (node : Node_Access) is
      -- Buffer : Unbounded_String;
   begin
      -- Ada.Text_IO.Put_Line ("vertices <- matrix(" & Tree_Node.Nodes (node) & ",2)");
      if node.Left /= null then
         Print_Tree (node.Left);
      end if;
      Print_Transform_Image_2 (node.Point);
      if node.Right /= null then
         Print_Tree (node.Right);
      end if;
   end Print_Tree;

   procedure Copy (This: in out Tree_Access; Other: in Tree_Access) is
   begin
      This := new btree;
      Initialization (This, Other.Size);
      Copy_Tree (This.Root, Other.Root);
   end Copy;

   procedure Copy_Tree (This : in out Node_Access; Other: in Node_Access) is
   begin
      Assert (Set_Point_Coord (This, Other.Point));
      if Other.Left /= null then
         Copy_Tree (This.Left, Other.Left);
      end if;

      if Other.Right /= null then
         Copy_Tree (This.Right, This.Right);
      end if;
   end Copy_Tree;

   function Next_Degree (TVec : Tree_Vector.Vector) return Tree_Vector.Vector is
      Adj_Vec : Point_Vector.Vector;
      Adj_Vec2 : Point_Vector.Vector;
      Node_Points : Point_Vector.Vector;
      Tree_Vec : Tree_Vector.Vector;
      Good : Boolean := True;
      IndexL : Point_Vector.Extended_Index;
      IndexR : Point_Vector.Extended_Index;
      Leaf : Node_Access := null;
      Buffer_Tree : Binary_Tree.Tree_Access := null;
   begin
      for Tree of TVec loop 
         
         Node_Points := Tree_Node.Get_Point_Vector (Tree.Root);
         Leaf := Tree_Node.Next_Leaf(Tree.Root);
         Adj_Vec := Plane_Tessellation.Adjacents (Leaf.Point);
         IndexL := Adj_Vec.First_Index;
         Good := True;
         while IndexL <= Adj_Vec.Last_Index loop
            declare
               pointL : PlTess_Access;
            begin
               Good := True;
               pointL := Adj_Vec.Element (IndexL);
               for node of Node_Points loop
                  if pointL = node then
                     Good := False;
                     exit;
                  end if;
               end loop;
               
               if Good = True then
                  -- Point_Vector.Delete (Adj_Vec, IndexL, 1);
                  
                  Adj_Vec2 := Adj_Vec;
                  Point_Vector.Delete(Adj_Vec2, IndexL,1);
                  --Delete (Adj_Vec2, IndexL, 1);
                  IndexL := IndexL + 1;
                  IndexR := Adj_Vec2.First_Index;

                  while IndexR <= Adj_Vec2.Last_Index loop
                     declare
                        pointR : PlTess_Access;
                        D_Leaf : Node_Access ;
                     begin
                        Good := True;
                        pointR := Adj_Vec2.Element (IndexR);

                        for node of Node_Points loop
                           if pointR = node then
                              Good := False;
                              exit;
                           end if;
                        end loop;
                        if Good = True then
                           Buffer_Tree := null;
                           Copy (Buffer_Tree, Tree);
                           D_Leaf := Tree_Node.Next_Leaf(Buffer_Tree.Root);
                           D_Leaf.Left := new tnode;
                           D_Leaf.Right := new tnode;
                           Assert (Set_Point_Coord(D_Leaf.Left,pointL));
                           Assert (Set_Point_Coord(D_Leaf.Right,pointR));
                           Tree_Vec.Append(Buffer_Tree);
                        end if;
                        Point_Vector.Delete (Adj_Vec2, IndexR, 1);
                     end;
                  end loop;
               else
                  Point_Vector.Delete(Adj_Vec, IndexL, 1);
               end if;
            end;
         end loop;

      end loop;

      return Tree_Vec;
   end Next_Degree;


end Binary_Tree;