with Ada.Assertions;
use Ada.Assertions;
with Ada.Strings;
with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;
with Ada.Text_IO;
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
         

end Binary_Tree;