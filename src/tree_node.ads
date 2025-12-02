with Plane_Tessellation;
use Plane_Tessellation;
package Tree_Node is
   type tnode;
   type Node_Access is access tnode;

   type tnode is 
      record 
         --Parent : Node_Access := null;
         Left : Node_Access := null;
         Right : Node_Access := null;
         --Value : Boolean := false;  -- maybe, for visited, when searching
         Point : PlTess_Access := null;
      end record;
   function Is_Point_Null (This : Node_Access) return Boolean;
   function Is_Full (This : Node_Access) return Boolean;

   function Is_Node_Point_Access (This : PlTess_Access) return Boolean;
   function Is_Node_Point (a, b, c : float) return Boolean;
   
   function Nodes (This : Node_Access) return Natural;
   
   function Insert_Node (This: Node_Access; Node: tnode) return Boolean ;

   function Insert_Point_Access (This : Node_Access; Point : PlTess_Access) return Boolean;
   function Insert_Point (This : Node_Access; point : pltess) return Boolean;
   function Insert_Point_Values (This : Node_Access; A, B, C : Float) return Boolean;
   
   --procedure Print_Values (This : Node_Access);
   
   function Set_Point_Access (This : in out Node_Access; coord : PlTess_Access) return Boolean;
   function Set_Point_Values (This : in out Node_Access; A, B, C : Float) return Boolean;
   function Set_Point (This : in out Node_Access; point : pltess) return Boolean;
   
   function Get_Point (This : Node_Access) return PlTess_Access;
   
   function Next_Leaf (This : Node_Access) return Node_Access;
   
   function Next_Empty (This : Node_Access) return Node_Access;
   
   function Get_Point_Vector (This : Node_Access) return Point_Vector.Vector;
   
end Tree_Node;