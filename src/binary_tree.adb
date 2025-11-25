package body Binary_Tree is

   procedure Initialization (This : Tree_Access; S : Natural) is
      Counter : Natural := 0;
   begin
      This.Root := new Tree_Node.tnode;
      while Counter < S loop
         Tree_Node.Insert_Node (This.Root, new Tree_Node.tnode);
         Counter := Counter + 1;
      end loop;
      This.Size := Counter;
   end Initialization;
end Binary_Tree;