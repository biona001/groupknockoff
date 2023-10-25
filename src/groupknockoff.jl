module groupknockoff

using Knockoffs
using LinearAlgebra
using DelimitedFiles

function julia_main()::Cint
    sigma_file = ARGS[1]    # directory to correlation matrix
    m = parse(Int, ARGS[2]) # number of knockoffs to generate (defines PSD constrait)

    # check for basic errors
    outdir = dirname(sigma_file)
    S11_outfile = joinpath(outdir, "S11.txt")
    S_outfile = joinpath(outdir, "S.txt")
    g_outfile = joinpath(outdir, "groups.txt")
    rep_outfile = joinpath(outdir, "group_reps.txt")
    isfile(S11_outfile) && error("$S11_outfile already exist")
    isfile(S_outfile) && error("$S_outfile already exist")
    isfile(g_outfile) && error("$g_outfile already exist")
    isfile(rep_outfile) && error("$rep_outfile already exist")

    # read sigma and check for errors
    Sigma = readdlm(sigma_file)
    if !all(isone, diag(Sigma))
        error("Input is not a correlation matrix! Diagonal elements should all be 1")
    end
    if !isapprox(Sigma, Sigma', rtol=1e-9)
        error("Input is matrix not symmetric!")
    end

    # run group knockoff procedure
    Sigma = Symmetric(Sigma)
    groups = hc_partition_groups(Sigma, cutoff=0.5, linkage=:average)
    group_reps = choose_group_reps(Sigma, groups, threshold=0.5)
    S11, S, _ = solve_s_graphical_group(
        Sigma, groups, group_reps, :maxent, m=m, verbose=true
    )

    # save output
    writedlm(S11_outfile, S11)
    writedlm(S_outfile, S)
    writedlm(g_outfile, groups)
    writedlm(rep_outfile, groups)

    return 0
end

end # module groupknockoff

