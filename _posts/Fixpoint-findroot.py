from autograd import grad
from scipy.optimize import root, fixed_point, newton

machine_eps = 1e-14
tole = 1e-5

maxit = 20

def find_fixpoint(g, fixpoint_cand, fixpoint_res, tolerance=0):
  ptol = "{:1e}".format(tolerance)
  fp = fixpoint_res

  xi = fixpoint_cand
  print(f"Fixed point is at {fp}")
  for i in range(maxit):
    xi = g(xi)
    distance = abs(xi-fp)
    pdis = "{:.4e}".format(distance)
    k = "<" if distance < tolerance else ">"
    pxi = "{:.4e}".format(xi)
    pi = "{:2d}".format(i+1)
    outputstr = \
    f"after iteration {pi}, itres:{pxi} distance from Fixed point:{pdis} {k} tolerance:{ptol}"
    print(outputstr)
    if distance < tolerance:
      break

def NewtonsMethod(f, root_cand, tolerance=0):
  print(f"Newton's Method, initial at {root_cand}, with tolerance {tolerance}")
  df = grad(f)
  g = lambda x: x - (f(x)/df(float(x)))
  find_fixpoint(g, root_cand, (newton(f, root_cand)), tolerance)


def SecantMethod(f, a_1, a_0, fp, tolerance=0):
  ptol = "{:1e}".format(tolerance)
  gx2 = lambda x0, x1 : x1 - (x1 - x0)*(f(x1))/(f(x1) - f(x0))
  g = gx2
  x_i_2 = a_1
  x_i_1 = a_0
  for i in range(maxit):
    xi = g(x_i_2, x_i_1)
    distance = abs(xi-fp)
    pdis = "{:.4e}".format(distance)
    k = "<" if distance < tolerance else ">"
    pxi = "{:.4e}".format(xi)
    pi = "{:2d}".format(i + 1)
    outputstr = \
    f"after iteration {pi}, itres:{pxi} distance from Fixed point:{pdis} {k} tolerance:{ptol}"
    print(outputstr)
    if distance < tolerance:
      break
    x_i_1, x_i_2 = xi, x_i_1

# NewtonsMethod(lambda x: x**3 - 8, 3)
# SecantMethod(lambda x: x**3 - 8, 0, 3, 2)
