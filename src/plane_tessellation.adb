with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;
with Ada.Text_IO;
package body Plane_Tessellation is
   function To_Cartesian(This: PlTess_Access) return Cartesian_Plane.cartesian is
      Coordinates : Cartesian_Plane.cartesian;
   begin
      Coordinates.X := (This.A - This.C) / 2.0;
      Coordinates.Y := Sqrt(3.0) * This.B / 2.0;
      return Coordinates;
   end To_Cartesian;

   procedure Set(This: PlTess_Access; a, b, c : Float) is 
   begin
      This.A := a;
      This.B := b;
      This.C := c;
   end Set;

   procedure Print_Transform  (This: PlTess_Access) is
      Cart : Cartesian_Plane.cartesian;
   begin
      Cart := To_Cartesian (This);
      Ada.Text_IO.Put_Line ("(" & Float'Image(This.A) & "," & Float'Image(This.B) & "," & Float'Image(This.C) & ") -> (" &  Float'Image(Cart.X) & "," & Float'Image(Cart.Y) & ")");
   end Print_Transform;

   procedure Print_Transform_Image  (This: PlTess_Access) is
      Cart : Cartesian_Plane.cartesian;
   begin
      Cart := To_Cartesian (This);
      Ada.Text_IO.Put_Line ("(" & Float'Image(Cart.X) & "," & Float'Image(Cart.Y) & ")");
   end Print_Transform_Image;
end Plane_Tessellation;