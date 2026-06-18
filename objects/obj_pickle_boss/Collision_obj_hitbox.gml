if other.master != self and array_contains(other.attacked, self) == false
{
	
	if (other.master != obj_EnemyParent) {
		array_push(other.attacked, self)
		hp -= other.damage;
		show_debug_message(hp);
		
	}
}