with Cartesian_Plane;
package Plane_Tessellation is
   type pltess;
   type PlTess_Access is access pltess;
   type pltess is
      record   
         A, B, C : Float := 0.0;
      end record;

   function To_Cartesian (This: PlTess_Access) return Cartesian_Plane.cartesian;
   procedure Set(This: PlTess_Access; a, b, c : Float);
   procedure Print_Transform  (This: PlTess_Access) ;
   procedure Print_Transform_Image  (This: PlTess_Access) ;
end Plane_Tessellation;