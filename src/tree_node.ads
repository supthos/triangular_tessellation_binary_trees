with Plane_Tessellation;
use Plane_Tessellation;
package Tree_Node is
   type tnode;
   type Node_Access is access tnode;

   type tnode is 
      record 
         Left : Node_Access;
         Right : Node_Access;
         Value : Boolean := false;
         Point : PlTess_Access := null;
      end record;
   function Is_Full (This : Node_Access) return Boolean;
   function Nodes (This : Node_Access) return Natural;
   procedure Insert_Node (This : Node_Access; node : Node_Access);
   procedure Print_Values (This : Node_Access);
   function Set_Point_Coord (This : Node_Access; coord : PlTess_Access) return Boolean;
   function Set_Point (This : Node_Access; A, B, C : Float) return Boolean;
   function Get_Point (This : Node_Access) return PlTess_Access;

end Tree_Node;