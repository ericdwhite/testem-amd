define(['amd-app/app'], function(Mapper){
  describe('Mapper', function(){
    it('should double each element in the array', function(){
      var doubled = Mapper.double([1, 2, 3])
      expect(doubled[0]).toBe(2)
      expect(doubled[1]).toBe(4)
      expect(doubled[2]).toBe(6)
    })
  })
})

