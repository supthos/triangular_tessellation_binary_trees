with Ada.Containers;
with Ada.Containers.Vectors;
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
   procedure Print_Transform_Image_2  (This: PlTess_Access) ;
   
   package Point_Vector is new Ada.Containers.Vectors
      (Index_Type => Natural, Element_Type => PlTess_Access);

   procedure Print_R_Plot (Points: Point_Vector.Vector);

   function Point_Constructor (a, b, c : Float) return PlTess_Access;
   function Point_Constructor (p : PlTess_Access) return PlTess_Access;
   function Adjacents (This : PlTess_Access) return Point_Vector.Vector;
end Plane_Tessellation;