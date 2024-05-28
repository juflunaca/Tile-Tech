<template>
  <div class="team-member">
    <table class="team-table">
      <tr>
        <td>
          <img :src="image" alt="Photo of {{ name }}" class="team-member__photo" />
        </td>
        <td>
          <h3 class="team-member__name">{{ name }}</h3>
          <p class="team-member__role">{{ role }}</p>
        </td>
      </tr>
    </table>
    
  </div>
</template>

<script>
export default {
  props: {
    name: String,
    role: String,
    image: String
  }
}
</script>

<style scoped>
.team-member {
  text-align: center;
  margin: 1em;
}

.team-member__photo {
  width: 100px;
  height: 100px;
  
  border-radius: 10%;
}
.team-member__name {
  margin: 0.5em 0 0.2em;
  width: 100%;
}
.team-table {
  width: 500px;
  border-collapse: collapse;
}
.team-member__role {
  margin: 0;
  color: #666;
}
</style>
