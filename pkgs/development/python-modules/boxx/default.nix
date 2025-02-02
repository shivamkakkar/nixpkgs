{ lib
, buildPythonPackage
, fetchPypi
, python
, xvfb-run
, matplotlib
, scikitimage
, numpy
, pandas
, imageio
, snakeviz
, fn
, pyopengl
, seaborn
, pytorch
, torchvision
}:

buildPythonPackage rec {
  pname = "boxx";
  version = "0.9.10";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-Iw6jRhKAroqfWmbXhD7YTn4s8FrE/Iyd31EOP0tMdkQ=";
  };

  propagatedBuildInputs = [
    matplotlib
    scikitimage
    numpy
    pandas
    imageio
    snakeviz
    fn
    pyopengl
    seaborn
  ];

  pythonImportsCheck = [ "boxx" ];
  checkInputs = [
    xvfb-run
    pytorch
    torchvision
  ];

  checkPhase = ''
    xvfb-run ${python.interpreter} -m unittest
  '';

  meta = with lib; {
    description = "Tool-box for efficient build and debug in Python. Especially for Scientific Computing and Computer Vision.";
    homepage = "https://github.com/DIYer22/boxx";
    license = licenses.mit;
    maintainers = with maintainers; [ lucasew ];
  };
}
