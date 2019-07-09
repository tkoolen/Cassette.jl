@noinline f(a::Int, b=2, c=3) = a
@noinline foobuzz() = 1
# @noinline binger() = invoke(f, Tuple{Int}, foobuzz())

@noinline binger() = f(foobuzz())

using Cassette
Cassette.@context Ctx
# Cassette.overdub(::Ctx, ::typeof(foobuzz)) = 2
Cassette.overdub(Ctx(), binger)
