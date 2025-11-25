with Ada.Text_IO;
package body Tree_Node is
   function Is_Full (This : Node_Access) return Boolean is
   begin
      if This.Left /= null and This.Right /= null then
         return true;
      else 
         return false;
      end if;
   end Is_Full;
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
   procedure Insert_Node (This : Node_Access; node : Node_Access) is
   begin
      if not Is_Full(This) then
         if This.Left = null then 
            This.Left := node;
         elsif This.Right = null then
            This.Right := node;
         end if;
      else 
         if Nodes(This.Right) < Nodes(This.Left) then
            Insert_Node (This.Right, node);
         else 
            Insert_Node (This.Left, node);
         end if; 
      end if;
   end Insert_Node;

   procedure Print_Values (This : Node_Access) is
   begin
      if This.Left /= null then
         Print_Values (This.Left);
      end if;
      Ada.Text_IO.Put_Line (Boolean'Image(This.Value));
      if This.Right /= null then
         Print_Values (This.Right);
      end if;
   end Print_Values;
end Tree_Node;
