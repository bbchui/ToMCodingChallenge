require 'cuboid'

#This test is incomplete and, in fact, won't even run without errors.
#  Do whatever you need to do to make it work and please add your own test cases for as many
#  methods as you feel need coverage
describe Cuboid do
  subject(:cube) {Cuboid.new([0,0,0],1,2,3)}
  let(:cube2) {Cuboid.new([2,2,2],3,4,5)}
  let(:cube3) {Cuboid.new([0,1,1],2,4,6)}

  describe "#initialize" do
    it "sets origin to [0,0,0]" do
      expect(cube.origin).to eq([0,0,0])
    end

    it "sets cuboid's width to 1" do
      expect(cube.width).to eq(1)
    end

    it "sets cuboid's height to 2" do
      expect(cube.height).to eq(2)
    end

    it "sets cuboid's length to 3" do
      expect(cube.leng).to eq(3)
    end

  end

  describe "#move_to!" do
    it "changes the origin in the simple happy case" do
      expect(cube.move_to!(1,2,3)).to eq(cube.origin)
    end

    it "does not allow moving to the same origin" do
      cube.move_to!(1,2,3)
      expect do
        cube.move_to!(1,2,3)
      end.to raise_error("Cuboid already at this origin")
    end
  end

  describe "#vertices" do
    it "gets the vertices of the cuboid" do
      expect(cube.vertices).to eq({:bbl=>[0, 0, 0],
                                   :bbr=>[1, 0, 0],
                                   :fbl=>[0, 0, 3],
                                   :fbr=>[1, 0, 3],
                                   :btl=>[0, 2, 0],
                                   :btr=>[1, 2, 0],
                                   :ftl=>[0, 2, 3],
                                   :ftr=>[1, 2, 3]})
    end
  end

  describe "intersects?" do
    it "checks if two cubes overlap/intersect each other" do
      expect(cube.intersects?(cube2)).to be false
      expect(cube.intersects?(cube3)).to be true
    end

  end

end
