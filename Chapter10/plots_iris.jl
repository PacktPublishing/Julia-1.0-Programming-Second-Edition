using StatPlots, RDatasets
iris = dataset("datasets", "iris")
@df iris scatter(:SepalLength, :SepalWidth, group=:Species,
    m=(0.5, [:+ :h :star7], 4), bg=RGB(1.0,1.0,1.0))