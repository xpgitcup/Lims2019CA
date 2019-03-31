package cn.edu.cup.common

class Caption {

    String name
    String logo
    String title
    String description
    String href

    static constraints = {
        name(unique: true)
        logo(nullable: true)
        title()
        description(nullable: true)
        href(nullable: true)
    }

    String toString() {
        return "${name}"
    }
}
