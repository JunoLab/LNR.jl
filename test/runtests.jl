using LNR, Test

@testset "LNR" begin
  io = IOBuffer("""
    lorem ipsum
    dolor sit amet
    consectetur adipiscing elit
    """) |> LineNumberingReader

  @test cursor(io) == Cursor(1, 1)

  @test readline(io) == "lorem ipsum"

  @test cursor(io) == Cursor(2, 1)

  seek(io, Cursor(1, 7))

  @test read(io, Char) == 'i'

  seek(io, Cursor(3, 13))

  @test read(io, Char) == 'a'
end
