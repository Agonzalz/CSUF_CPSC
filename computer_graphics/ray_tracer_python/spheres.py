from sphere import Sphere
import numpy as np

class Spheres:
    # objects = [
    #     Sphere(center=(-0.2, 0, -1), radius=0.7, diffuse=(0.7, 0, 0)),

    #     Sphere(center=(1.2, 0, -1), radius=0.7, diffuse=(0, 0, 0.7)),
    #     Sphere(center=( -1.6, 0, -1), radius=0.7, diffuse=(0.7, 0.7, 0)),

    #     Sphere(center=(9, -9000, 0), radius = 9000 - 0.7, ambient=(0.1, 0.1, 0.1))
    # ]
    
    def create_cluster(x, y, z, r, g ,b):
        objects = [ 
        Sphere(center=(x, y, z), radius= 0.3),
        Sphere(center=(x-0.5, y, z), radius=0.3, diffuse=(r, g, b)),
        Sphere(center=(x+0.5, y, z), radius=0.3, diffuse=(r, g, b)),
        Sphere(center=(x, y+0.5, z), radius=0.3, diffuse=(r, g, b)),
        Sphere(center=(x, y-0.5, z), radius=0.3, diffuse=(r, g, b)),
        Sphere(center=(x, y, z+0.5), radius=0.3, diffuse=(r, g, b)),
        Sphere(center=(x, y, z-0.5), radius=0.3, diffuse=(r, g, b))
        ]
        return objects
    
    @staticmethod
    def generate_objects():
        objects = []
        objects = [
            Sphere(center=(9, -9000, 0), radius= 9000 - 0.7, ambient =(0.1, 0.1, 0.1))]

        objects.extend(Spheres.create_cluster(-1, 0, -1, 0.7, 0, 0))
        objects.extend(Spheres.create_cluster(2, 0, -4, 0, 0.5, 0))
        objects.extend(Spheres.create_cluster(-2, 2, -6, 0, 0, 0.8))
        objects.extend(Spheres.create_cluster(-1, 3, -2, 0.7, 0, 0.6))
        objects.extend(Spheres.create_cluster(1, 3,-7, 0.4, 0.6, 0.5))
        
        return objects


    @staticmethod
    def get_spheres():
        return Spheres.generate_objects()

    @staticmethod
    def get_camera():
        return np.array([0, 0, 1])
