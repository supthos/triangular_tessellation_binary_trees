package Tree_Node is
   type tnode;
   type Node_Access is access tnode;

   type tnode is 
      record 
         Left : Node_Access;
         Right : Node_Access;
         Value : Boolean := false;
      end record;
   function Is_Full (This : Node_Access) return Boolean;
   function Nodes (This : Node_Access) return Natural;
   procedure Insert_Node (This : Node_Access; node : Node_Access);
   procedure Print_Values (This : Node_Access);
end Tree_Node;