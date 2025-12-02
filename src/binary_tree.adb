
with Ada.Text_IO;
with Ada.Wide_Text_IO;

package body Binary_Tree is
   procedure Initialization (This : Tree_Access) is
      Result : Boolean := True;
   begin
      This.Root := new tnode;
      Result := Set_Point_Values (This.Root, 0.0, 0.0, 0.0) ;
      if Result then
         This.Size := 1;
      else
         Ada.Text_IO.Put_Line("No point values set");
      end if;
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
      Initialization (This);
      Copy_Tree (This.Root, Other.Root);
   end Copy;

   procedure Copy_Tree (This : in out Node_Access; Other: in Node_Access) is
      Result : Boolean := True ;
   begin
      This := new tnode;
      Result := (Set_Point_Access (This, Other.Point));
      if Result and Other.Left /= null then
         Copy_Tree (This.Left, Other.Left);
      end if;

      if Result and Other.Right /= null then
         Copy_Tree (This.Right, Other.Right);
      end if;
   end Copy_Tree;

   function Next_Degree (TVec : Tree_Vector.Vector) return Tree_Vector.Vector is
      Adj_Vec : Point_Vector.Vector;
      Adj_Vec2 : Point_Vector.Vector;
      Node_Points : Point_Vector.Vector;
      Tree_Vec : Tree_Vector.Vector;
      Good : Boolean := True;
      Result : Boolean := True;
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
                  Adj_Vec2 := Adj_Vec;
                  Point_Vector.Delete(Adj_Vec2, IndexL,1);
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
                           Result := (Set_Point_Access (D_Leaf.Left,pointL));
                           Result := Result and (Set_Point_Access (D_Leaf.Right,pointR));
                           Buffer_Tree.Size := Buffer_Tree.Size + 2;
                           if Result then
                              Tree_Vec.Append(Buffer_Tree);
                           else 
                              Ada.Text_IO.Put_Line("No point set.");
                           end if;
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

   procedure Reduce (TVec : in out Tree_Vector.Vector) is
      A_Tree : Tree_Access;
      Tree_Index : Tree_Vector.Extended_Index;
      Out_TVec : Tree_Vector.Vector;
      --All_Good : Boolean := True;
   begin
      if not Tree_Vector.Is_Empty (TVec) then
         Tree_Index := TVec.First_Index;
         Copy(A_Tree,Tree_Vector.Element(TVec,Tree_Index));
         Tree_Vector.Append (Out_TVec, A_Tree);
         --Out_Tree_Index := Out_TVec.First_Index;
         --Tree_Index := Tree_Index + 1;
         while Tree_Index <= TVec.Last_Index loop
            -- A_Tree := new btree;
            Copy(A_Tree, Tree_Vector.Element (TVec, Tree_Index));
            for tree of Out_TVec loop   
               if Compare(Tree,A_Tree) = True then
                  Tree_Vector.Delete (TVec, Tree_Index, 1);
                  --exit;
               end if;
            end loop;
            if Tree_Vector.Element(TVec,Tree_Index) = A_Tree then
               Tree_Vector.Append (Out_TVec, A_Tree);
               Tree_Index := Tree_Index + 1 ;
            end if;
         end loop;
         Tree_Vector.Clear (TVec);
         TVec := Out_TVec;
      end if;
   end Reduce;

   -- return true if the trees are a rotation of each other
   function Compare (This, Other : Tree_Access) return Boolean is

      Translation : pltess ;
      --This_Angle : pltess ;
      --Other_Angle : pltess ;
      Rotation : pltess ;
      --This_Left_Angle: pltess;
      --Other_Left_Angle: pltess;
   begin
      if (This.Root = null) xor (Other.Root = null) then
         return False;
      elsif Is_Full(This.Root) then
         Translation := This.Root.Point.all - Other.Root.Point.all ;

         Rotation := (This.Root.Left.Point.all - This.Root.Point.all ) - (Other.Root.Left.Point.all - Other.Root.Point.all);
         return Compare (This.Root, Other.Root, Translation+Rotation);
      else
         return True;
      end if;
      
   end;

   function Compare (This, Other : Node_Access; Transformation : pltess) return Boolean is
   begin 
      if (This.Left = null and This.Right = null and Other.Left = null and Other.Right = null) then
         return True;
      elsif (Is_Full (This)) and (Is_Full (Other)) then
         if (This.Left.Point.all - This.Point.all) = (Other.Left.Point.all - Other.Point.all) then
            if (Other.Left.Point.all + Transformation = This.Left.Point.all) and (Other.Right.Point.all + Transformation = This.Right.Point.all) then

               if Compare (This.Left, Other.Left, Transformation) /= True then
                  return False;
               end if;

               if Compare (This.Right, Other.Right, Transformation) /= True then
                  return False;
               end if;

               return True;
            end if;
         else  
            return false;
         end if;

      elsif (This.Left /= null and Other.Left /= null) and (This.Right = null and Other.Right = null ) then 
         if (Other.Left.Point.all + Transformation = This.Left.Point.all) then
            if Compare (This.Left, Other.Left, Transformation) /= True then
               return False;
            end if;
         end if;
      elsif (This.Right /= null and Other.Right /= null) and (This.Left = null and Other.Left = null) then
         if (Other.Right.Point.all + Transformation = This.Right.Point.all) then
            if Compare (This.Right, Other.Right, Transformation) /= True then
               return False;
            end if;
         end if;
      else
         return false;
      end if;
   end Compare;      

   function Insert_Node (This: in out Tree_Access; Node : Node_Access) return Boolean is
   begin
      if This = null then
         This := new btree;
      end if;
      if This.Root /= null and Tree_Node.Insert_Node (This.Root, Node.all) then
         This.Size := This.Size + Nodes (Node);
         return true;
      else
         return False;
      end if;
   end Insert_Node;

   function Insert_Point (This : in out Tree_Access; Point : pltess) return boolean is
   begin
      if This = null then
         This := new btree;
      end if;
      if Insert_Point (This.Root, Point) = True then  
         This.Size := This.Size + 1;
         return true;
      else
         return False;
      end if;
   end Insert_Point;

   function Insert_Point_Access (This : in out Tree_Access; Point : PlTess_Access) return boolean is
   begin
      if This = null then
         This := new btree;
      end if;
      if Tree_Node.Insert_Point_Access (This.Root, Point) = True then  
         This.Size := This.Size + 1;
         return true;
      else
         return False;
      end if;
   end Insert_Point_Access;

   function Insert_Point_Values (This : in out Tree_Access; A, B, C : Float) return boolean is
   begin 
      if This = null then
         This := new btree;
      end if;
      if Insert_Point_Values (This.Root, A, B, C) = True then
         This.Size := This.Size + 1;
         return True;
      else 
         return False;
      end if;
   end Insert_Point_Values;
end Binary_Tree;