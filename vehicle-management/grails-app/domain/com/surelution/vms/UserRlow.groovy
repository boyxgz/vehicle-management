package com.surelution.vms

import org.apache.commons.lang.builder.HashCodeBuilder

class UserRlow implements Serializable {

	private static final long serialVersionUID = 1

	User user
	Rlow rlow

	boolean equals(other) {
		if (!(other instanceof UserRlow)) {
			return false
		}

		other.user?.id == user?.id &&
			other.rlow?.id == rlow?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (user) builder.append(user.id)
		if (rlow) builder.append(rlow.id)
		builder.toHashCode()
	}

	static UserRlow get(long userId, long rlowId) {
		UserRlow.where {
			user == User.load(userId) &&
			rlow == Rlow.load(rlowId)
		}.get()
	}

	static UserRlow create(User user, Rlow rlow, boolean flush = false) {
		new UserRlow(user: user, rlow: rlow).save(flush: flush, insert: true)
	}

	static boolean remove(User u, Rlow r, boolean flush = false) {

		int rowCount = UserRlow.where {
			user == User.load(u.id) &&
			rlow == Rlow.load(r.id)
		}.deleteAll()

		rowCount > 0
	}

	static void removeAll(User u) {
		UserRlow.where {
			user == User.load(u.id)
		}.deleteAll()
	}

	static void removeAll(Rlow r) {
		UserRlow.where {
			rlow == Rlow.load(r.id)
		}.deleteAll()
	}

	static mapping = {
		id composite: ['rlow', 'user']
		version false
	}
}
