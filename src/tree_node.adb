with Ada.Assertions;
use Ada.Assertions;
with Ada.Text_IO;
with Tree_Node;
package body Tree_Node is
   function Is_Point_Null (This : Node_Access) return Boolean is
   begin
      if This.Point = null then
         return True;
      else  
         return False;
      end if;
   end Is_Point_Null;

   function Is_Full (This : Node_Access) return Boolean is
   begin
      if This.Left /= null and This.Right /= null then
         return true;
      else 
         return false;
      end if;
   end Is_Full;

   function Is_Node_Point (a, b, c : float) return Boolean is
   begin
      return (a + b + c = 0.0); 
   end Is_Node_Point;

   function Is_Node_Point_Access (This : PlTess_Access) return Boolean is
   begin
      return Is_Node_Point (This.A, This.B, This.C) ;
   end Is_Node_Point_Access;

   function Nodes (This : Node_Access) return Natural is
      Counter : Natural := 0;
   begin
      if This.Left /= null then
         Counter := Counter + 1;
         Counter := Counter + Nodes(This.Left);
      end if;
      if This.Right /= null then
         Counter := Counter + 1;
         Counter := Counter + Nodes(This.Right);
      end if;
      return Counter;
   end Nodes;

   function Insert_Node (This: Node_Access; Node: tnode) return Boolean is
   begin
      if This /= null then
         Next_Empty (This).all := Node ;
         return True;
      else
         return False;
      end if;
   end Insert_Node;
      

   function Insert_Point_Access (This : Node_Access; Point : PlTess_Access) return Boolean is
   begin
      return Insert_Point (This, Point.all);
   end Insert_Point_Access;

   function Insert_Point (This : Node_Access; point : pltess) return Boolean is
   begin 
      if This.Left = null and Set_Point(This.Left, point) then
         return True;
      elsif This.Right = null  and Set_Point(This.Right, point) then
         return True;
      else 
         if Nodes(This.Right) < Nodes(This.Left) and Insert_Point (This.Right, point) then
            return True;
         else 
            Assert(Insert_Point (This.Left, point));
         end if;
      end if;
   end;

   function Insert_Point_Values (This : Node_Access; A, B, C : Float) return Boolean is
   begin
      if This.Left = null and (Set_Point_Values(This.Left, A, B, C)) then
         return true;
      elsif This.Right = null and Set_Point_Values(This.Right, A, B, C) then
         return true;
      else 
         if (Nodes(This.Right) < Nodes(This.Left)) and (Insert_Point_Values (This.Right, A, B, C)) then
            return true;
         else 
            return Insert_Point_Values (This.Left, A, B, C);
         end if;
      end if;
   end Insert_Point_Values;

   --  procedure Print_Values (This : Node_Access) is
   --  begin
   --     if This.Left /= null then
   --        Print_Values (This.Left);
   --     end if;
   --     Ada.Text_IO.Put_Line (Boolean'Image(This.Value));
   --     if This.Right /= null then
   --        Print_Values (This.Right);
   --     end if;
   --  end Print_Values;

   function Set_Point_Access (This : in out Node_Access; coord : PlTess_Access) return Boolean is
   begin
      if coord = null then
        if This.Point /= null then
            return False;
        end if;
        return True;
      elsif not Is_Node_Point_Access(coord) then
         return False;
      else 
         if This = null then
            This := new tnode;
         end if;
         Set (This.Point, coord.A, coord.B, coord.C);
      end if;
      return true;
   end Set_Point_Access;

   function Set_Point_Values (This : in out Node_Access; A, B, C : Float) return Boolean is
   begin
      if not Is_Node_Point (A, B, C) then
         return False ;
      else 
         if This = null then
            This := new tnode;
         end if;
         Set (This.Point, A, B, C);
      end if;
      return True;
   end Set_Point_Values;
      
   function Set_Point (This : in out Node_Access; point : pltess) return Boolean is
   begin
      return Set_Point_Values (This, point.A, point.B, point.C);
   end Set_Point;

   function Get_Point (This : Node_Access) return PlTess_Access is
   begin 
      return This.Point;
   end Get_Point;
   
   function Next_Leaf (This : Node_Access) return Node_Access is
   begin
      if This.Left = null and This.Right = null then
         return This;
      elsif Nodes (This.Right) < Nodes(This.Left) then 
         return Next_Leaf (This.Right);
      else 
         return Next_Leaf (This.Left);
      end if;
   end Next_Leaf;

   function Next_Empty (This : Node_Access) return Node_Access is
   begin
      if not Is_Full (This) then
         if This.Left = null then
            return This.Left;
         elsif This.Right = null then
            return This.Right;
         end if;
      else 
         if Nodes (This.Right) < Nodes(This.Left) then
            return Next_Empty (This.Right);
         else
            return Next_Empty (This.Left);
         end if;
      end if;
   end Next_Empty;
      
   function Get_Point_Vector (This : Node_Access) return Point_Vector.Vector is
      PVec : Point_Vector.Vector;
   begin 
      if This.Left /= null then 
         PVec.Append_Vector (Get_Point_Vector(This.Left));
      end if;
      PVec.Append (This.Point);
      if This.Right /= null then
         PVec.Append_Vector (Get_Point_Vector(This.Right));
      end if;
      return PVec;
   end Get_Point_Vector;





end Tree_Node;
